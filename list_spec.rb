require "rspec"

require_relative "list"

describe List do

  let(:task) { double(:task) }
  let(:list) { List.new('henry todo list') }

  describe "#initialize" do
    it "should create an instance of List" do
      list.should be_an_instance_of List
    end

    it "requires one argument" do
      expect {List.new}.to raise_error(ArgumentError)
    end

    it "defaults to an empty array of tasks" do
      expect list.tasks.length.should eq(0)
    end
  end

  describe "#add_task" do
    it "requires one argument for the task" do
      expect {list.add_task}.to raise_error(ArgumentError)
    end

    it "adds a new task to the 'tasks' array" do
      list.add_task(task)
      list.tasks.length.should eq(1)
    end
  end

  describe "#complete_task" do
    it "requires one argument for the task" do
      expect {list.complete_task}.to raise_error(ArgumentError)
    end

    it "should return false if the index doesn't exist in an array" do
      expect(list.complete_task(100)).to be_false
    end

    it "should take a given index and complete task at that index" do
      task.stub(complete!: true)
      list.add_task(task)
      expect(list.complete_task(0)).to be_true
    end
  end

  describe "#delete_task" do
    it "requires one argument for the task" do
      expect {list.delete_task}.to raise_error(ArgumentError)
    end

    it 'returns false if the task passed in does not exist in the array' do
      expect(list.delete_task(100)).to be_false
    end

    it "deletes a new task from the 'tasks' array" do
      list.add_task(task)
      list.delete_task(0)
      list.tasks.length.should eq(0)
    end
  end

  describe "#completed_tasks" do
    it "should return an array of the completed tasks" do
      task.stub(complete?: true)
      list.add_task(task)
      expect(list.completed_tasks.length).to eq(1)
    end
  end

  describe "#incomplete_tasks" do
    it "should return an array of the incomplete tasks" do
      task.stub(complete?: false)
      list.add_task(task)
      expect(list.incomplete_tasks.length).to eq(1)
    end
  end

end
