require 'test_helper'

class JobTest < ActiveSupport::TestCase
    
    def setup
        @user = User.create(username: "Asim", email: "asimsaleem@hotmail.com", experstise: "He is a software engineer", experience: "4 years", skills: "Java, Sql , php, Css , HTML.", location: "Sydney" )
        @job = @user.jobs.build(title: "Software Developer", summary: "This job is for a software developer.", 
        description: "This job is for a .NET developer with 3 years of experience and must be an Australian citizen.")
        
    end
    
    test "job should be valid" do
        assert @job.valid?
    end
    
    test "user_id should be present" do
        @job.user_id = nil
        assert_not @job.valid?
    end
     
    
    test "title should be present" do
        @job.title = " "
        assert_not @job.valid?
    end
    
    test "title should not be too long" do
        @job.title = "a" * 101
        assert_not @job.valid?
    end
    
    test "title should not be too short" do
        @job.title = "aaaa"
        assert_not @job.valid?
    end
    
    test "summary should be present" do
        @job.summary = " "
        assert_not @job.valid?
    end
    
    test "summary lenght should not be too long" do
        @job.summary = "a" * 501
        assert_not @job.valid?
    end
    
    test "summary lenght should not be too short" do
         @job.summary = "a" * 9
        assert_not @job.valid?
    end
    
    test "description must be present" do
        @job.description = " "
        assert_not @job.valid?
    end
    
    test "description should not be too long" do
        @job.description = "a" * 1501
        assert_not @job.valid?
    end
    
    test "description should not be too short" do
        @job.description = "a" * 9
        assert_not @job.valid?
    end
    
    
    
end
