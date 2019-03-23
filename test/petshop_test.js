'use strict';
const config = require('../config');
const chai = require('chai');
const chaiHttp = require('chai-http');
const should = chai.should();
const server = require('../app');

chai.use(chaiHttp);

describe('/GET', () => {
    it('get all pets', (done) => {
        chai.request(`http://localhost:${config.port}`)
            .get('/pets')
            .end((err, res) => {
                res.should.have.status(200);
                res.text.should.contain('dog');
                res.text.should.contain('cat');
                res.text.should.contain('fish');
                done();
            });
    });
});

describe('/GET', () => {
    it('get dog', (done) => {
        chai.request(`http://localhost:${config.port}`)
            .get('/pets/1')
            .end((err, res) => {
                res.should.have.status(200);
                res.text.should.contain('dog');
                done();
            });
    });
});

describe('/GET', () => {
    it('get cat', (done) => {
        chai.request(`http://localhost:${config.port}`)
            .get('/pets/2')
            .end((err, res) => {
                res.should.have.status(200);
                res.text.should.contain('cat');
                done();
            });
    });
});

describe('/GET', () => {
    it('get fish', (done) => {
        chai.request(`http://localhost:${config.port}`)
            .get('/pets/3')
            .end((err, res) => {
                res.should.have.status(200);
                res.text.should.contain('fish');
                done();
            });
    });
});
