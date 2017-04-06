class SearchController < ApplicationController
  def class_find
  end

  def student_find
  end

  def index
    #通过传入的参数，查找到home的实例，如果不存在，会出错（实例不存在）
    @home = Home.find_by_name(params[:s])
  end

  def index_student
    #通过传入的参数，查找到home的实例，如果不存在，返回的是一个[]（空数组），可以通过他的@students.length != 0来判断
    @students = Student.where(:name => params[:s])
  end
end
