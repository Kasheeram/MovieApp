//
//  MovieAppTests.swift
//  MovieAppTests
//
//  Created by Kashee ram on 8/18/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import XCTest
@testable import MovieApp

class MovieAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    
    func testMoviesViewModel() {
        let result = Result(id: 0, voteAverage: 7.5, title: "My title", posterPath: "/kashee/image.png")
        let moviesViewModel = MoviesViewModel(results: result)
        // For title test case is passing because result title value's is same movesViewModel title
        XCTAssertEqual(result.title, moviesViewModel.title) // checking for tile value

    }

    func testMoviesViewModelVoteCount() {
        let result = Result(id: 0, voteAverage: 7.5, title: "My title", posterPath: "/kashee/image.png")
        let moviesViewModel = MoviesViewModel(results: result)

        // Vote average test case is failing because we change data type and value for voteAverage in moviesViewModel
//        XCTAssertEqual(result.voteAverage, moviesViewModel.voteAverage)


        // This test case is passing because we are using same login as moviesViewModel
        let votePercentage = Int((result.voteAverage! / 10) * 100)
        XCTAssertEqual("\(votePercentage)%", moviesViewModel.voteAverage) // vhecking for vote count

    }

    func testMoviesViewModelPoster() {
        let result = Result(id: 0, voteAverage: 7.5, title: "My title", posterPath: "/kashee/image.png")
        let moviesViewModel = MoviesViewModel(results: result)

        // For poster path test case is passing because result poster path value's is same movesViewModel poster path
        XCTAssertEqual(result.posterPath, moviesViewModel.posterPath)

    }
    
    
}
