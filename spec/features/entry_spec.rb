#require "entry"

require 'rails_helper'
#describe Entry do
#    describe ".addrecord" do
#        context "given 'Runtestuniquename' 10 10 10" do
#            it "successfully adds record" do
#                #before_count = Entry.count
#                #Entry.create!(:activity_type => "Run", :distance => 10, :time => 10, :steps => 10)
#                #expect(Entry.count).not_to eq(before_count)
#                Entry.create!(:activity_type => "Runtestuniquename", :distance => 10, :time => 10, :steps => 10)
#                expect(Entry.where(:name => "Runtestuniquename")).to have(1).record
#            end
#        end
#    end
#end

#describe Entry do
#    describe ".dontadd" do
#        context "dont add entry to database" do
#            context "with missing step field" do
#                it "returns a successful insert" do
#
#                end
#            end
#        end
#    end
#end

describe Entry do
    describe ".addingEntry" do
        context "given valid inputs" do
            before do
                visit "/entries/new"
                fill_in('entry[activity_type]', with: 'Morning Run')
                fill_in 'entry[distance]', with: '10'
                fill_in 'entry[time]', with: '10'
                fill_in 'entry[steps]', with: '1000'
                click_on 'Create Entry'
                visit "/entries/#{@entry}"
            end
            it "successfully adds record and shows up on page" do
                expect(page).to have_content('Morning Run')
            end
        end
    end
end

describe Entry do
    describe ".addingEntry2" do
            context "given invalid inputs (missing activity type)" do
                before do
                    visit "/entries/new"
                    #fill_in('entry[activity_type]', with: 'Morning Run')
                    fill_in 'entry[distance]', with: '10'
                    fill_in 'entry[time]', with: '10'
                    fill_in 'entry[steps]', with: '1000'
                    click_on 'Create Entry'
                    #visit "/entries/#{@entry}"
                end
                it "Brings up an error since activity type was not filled in" do
                    expect(page).to have_content("Activity type can't be blank")
                end
            end
    end
end

describe Entry do
    describe ".addingEntry3" do
            context "given invalid inputs (missing distance)" do
                before do
                    visit "/entries/new"
                    fill_in('entry[activity_type]', with: 'Morning Run')
                    #fill_in 'entry[distance]', with: '10'
                    fill_in 'entry[time]', with: '10'
                    fill_in 'entry[steps]', with: '1000'
                    click_on 'Create Entry'
                    #visit "/entries/#{@entry}"
                end
                it "Brings up an error since distance was not filled in" do
                    expect(page).to have_content("Distance can't be blank")
                end
            end
    end
end

describe Entry do
    describe ".addingEntry4" do
            context "given invalid inputs (missing time)" do
                before do
                    visit "/entries/new"
                    fill_in('entry[activity_type]', with: 'Morning Run')
                    fill_in 'entry[distance]', with: '10'
                    #fill_in 'entry[time]', with: '10'
                    fill_in 'entry[steps]', with: '1000'
                    click_on 'Create Entry'
                    #visit "/entries/#{@entry}"
                end
                it "Brings up an error since time was not filled in" do
                    expect(page).to have_content("Time can't be blank")
                end
            end
    end
end

describe Entry do
    describe ".addingEntry5" do
            context "given invalid inputs (missing steps)" do
                before do
                    visit "/entries/new"
                    fill_in('entry[activity_type]', with: 'Morning Run')
                    fill_in 'entry[distance]', with: '10'
                    fill_in 'entry[time]', with: '10'
                    #fill_in 'entry[steps]', with: '1000'
                    click_on 'Create Entry'
                    #visit "/entries/#{@entry}"
                end
                it "Brings up an error since steps was not filled in" do
                    expect(page).to have_content("Steps can't be blank")
                end
            end
    end
end


describe Entry do
    describe ".updatingEntry" do
            context "given valid inputs" do
                it "succesfully updates the entry" do
                    jog = Entry.create!(activity_type: "Morning Jog", distance: '10', time: '10', steps: '100')
                    visit edit_entry_path(id: jog.id)
                    fill_in('entry[activity_type]', with: 'Evening Run')
                    click_on 'Update Entry'
                    visit "/entries/#{@entry}"
                    expect(page).to have_content("Evening Run")
                end
            end
    end
end

describe Entry do
    describe ".deletingEntry" do
        it "deletes the entry from the DB" do
            jog = Entry.create!(activity_type: "Morning Jog", distance: '10', time: '10', steps: '100')
            visit "/entries/#{@entry}"
            expect(page).to have_content('Morning Jog')
            click_on 'Destroy'
            expect(page).not_to have_content('Morning Jog')
        end
    end
end