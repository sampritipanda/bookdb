class Book < ActiveRecord::Base
  def query collection, params
    ISBNdb::Query.find(:collection => collection, :where => params)
  end
end
