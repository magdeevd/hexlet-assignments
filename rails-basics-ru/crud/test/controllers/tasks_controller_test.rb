# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attrs = {
      name: Faker::Artist.name,
      description: Faker::Movies::HarryPotter.quote,
      status: Faker::Movies::HarryPotter.spell,
      creator: Faker::Movies::HarryPotter.character,
      performer: Faker::Movies::HarryPotter.character,
      completed: Faker::Boolean.boolean
    }
  end

  test '#index' do
    get tasks_url
    assert_response :success
  end

  test '#show' do
    task = Task.create(@attrs)
    get task_url(task)
    assert_response :success
  end

  test '#new' do
    get new_task_url
    assert_response :success
  end

  test '#create' do
    post tasks_url, params: { task: @attrs }
    assert { Task.find_by(@attrs) }
    assert_response :redirect
  end

  test '#edit' do
    task = Task.create(@attrs)
    get edit_task_url task
    assert_response :success
  end

  test '#update' do
    task = Task.create(@attrs)
    patch task_url(task), params: { task: @attrs }
    assert { Task.find_by(@attrs) }
    assert_response :redirect
  end

  test '#destroy' do
    task = Task.create(@attrs)
    delete task_url(task)
    assert { !Task.find_by(@attrs) }
    assert_response :redirect
  end
end
