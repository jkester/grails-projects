package com.jankester



import org.junit.*
import grails.test.mixin.*

@TestFor(CarController)
@Mock(Car)
class CarControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/car/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.carInstanceList.size() == 0
        assert model.carInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.carInstance != null
    }

    void testSave() {
        controller.save()

        assert model.carInstance != null
        assert view == '/car/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/car/show/1'
        assert controller.flash.message != null
        assert Car.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/car/list'


        populateValidParams(params)
        def car = new Car(params)

        assert car.save() != null

        params.id = car.id

        def model = controller.show()

        assert model.carInstance == car
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/car/list'


        populateValidParams(params)
        def car = new Car(params)

        assert car.save() != null

        params.id = car.id

        def model = controller.edit()

        assert model.carInstance == car
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/car/list'

        response.reset()


        populateValidParams(params)
        def car = new Car(params)

        assert car.save() != null

        // test invalid parameters in update
        params.id = car.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/car/edit"
        assert model.carInstance != null

        car.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/car/show/$car.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        car.clearErrors()

        populateValidParams(params)
        params.id = car.id
        params.version = -1
        controller.update()

        assert view == "/car/edit"
        assert model.carInstance != null
        assert model.carInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/car/list'

        response.reset()

        populateValidParams(params)
        def car = new Car(params)

        assert car.save() != null
        assert Car.count() == 1

        params.id = car.id

        controller.delete()

        assert Car.count() == 0
        assert Car.get(car.id) == null
        assert response.redirectedUrl == '/car/list'
    }
}
