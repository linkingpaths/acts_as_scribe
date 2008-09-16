require File.join(File.dirname(__FILE__), '..', 'test_helper')

class ActsAsScribeTest < Test::Unit::TestCase
  
  context "The acts_as_scribe plugin" do
    
    setup do
      @margie = Factory(:user, :login => 'm.thatcher')
      @jaiku = Factory(:jaiku, :content => "To solve Britain’s economic Disease with Socialism is like treating leukaemia with leeches.", :user => @margie)
      @activity =  @jaiku.activities.first
    end
    
    should 'include the correct methods on user and jaiku class' do
      [:activities, :create_activity_from_self].each{|method|
        assert @jaiku.respond_to?(method, "Jaiku should responds_to #{method}")
      }
      [:activities, :activities_without_model, :record_activity].each{|method|
        assert @margie.respond_to?(method, "Jaiku should responds_to #{method}")
      }
    end
    should 'create a new activity every time a jaiku is created' do
      assert_equal 1, @jaiku.activities.size, "Create a jaiku should create a new activity"
    end
    
    should 'link the activities created on a model with the user that is generating the activity' do
      assert_equal @margie, @activity.user, "The activity should be registered as made by the user that create the jaiku"
    end
    
    should 'link the new activities to the correct model and id' do
      assert_equal @jaiku.class.to_s, @activity.item_type, "The activity should be linked to the first jaiku"
      assert_equal @jaiku.id, @activity.item_id, "The activity should be linked to the first jaiku"
    end
    
    should 'raise an exception if we try to record an activity that is not defined on the user class' do
      assert_raise RuntimeError do
          @margie.record_activity :not_defined_featured
      end
    end
    
    should 'create an activity without model if we use the record_activity method on a user' do
      @margie.record_activity :featured_on_home
      assert_equal 1, @margie.activities_without_model.size,  "Track an unlinked activity should create a new activity on the user model"
    end
    
  end
end