require 'spec_helper'

describe "Toy Tracker Application" do

    describe "/" do
      it "should return 200 from GET" do
        get '/'
        last_response.should be_ok
      end
    end

    describe "/toys/:type" do
      let(:type) { FactoryGirl.create :toy_type }

      describe "GET" do
        it "should return 200" do
          get "/toys/#{type.name}"
          last_response.should be_ok
        end
      end


      describe "POST" do
        before(:each) do
          @request = {
            "toy-name"     => "newtoy",
            "toy-material" => "wood",
            "talking"      => "on",
            "toy-size"     => "normal"
          }
        end

        let(:type) { FactoryGirl.create :toy_type }
        let(:toy)  { FactoryGirl.create :toy }

        it "should return 302 due to redirect" do
          post "/toys/#{type.name}", @request
          last_response.status.should eq(302)
        end

        it "should create a new embedded Toy" do
          post "/toys/#{type.name}", @request
          toys = ToyType.where(name: type.name).first.toys
          toys.map(&:name).should include("newtoy")
        end
      end

    end

    describe "/toys/:type/:id" do
      let(:type) { FactoryGirl.create :toy_type }

      describe "DELETE" do
        it "should return 200" do

        end

        it "should return 400 for a bad ID" do

        end

        it "should remove the database record" do

        end

      end

      describe "PUT" do
        it "should return 200 with valid data" do

        end

        it "should return 400 for bad data" do

        end

        it "should modify the database record" do

        end
      end
      
    end

end
