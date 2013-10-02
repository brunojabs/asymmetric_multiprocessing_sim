require 'test_helper'

class FakeProcessesControllerTest < ActionController::TestCase
  setup do
    @fake_process = fake_processes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fake_processes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fake_process" do
    assert_difference('FakeProcess.count') do
      post :create, fake_process: { done: @fake_process.done, name: @fake_process.name }
    end

    assert_redirected_to fake_process_path(assigns(:fake_process))
  end

  test "should show fake_process" do
    get :show, id: @fake_process
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fake_process
    assert_response :success
  end

  test "should update fake_process" do
    patch :update, id: @fake_process, fake_process: { done: @fake_process.done, name: @fake_process.name }
    assert_redirected_to fake_process_path(assigns(:fake_process))
  end

  test "should destroy fake_process" do
    assert_difference('FakeProcess.count', -1) do
      delete :destroy, id: @fake_process
    end

    assert_redirected_to fake_processes_path
  end
end
