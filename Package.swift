// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "example-project-1",
    platforms: [
       .macOS(.v13),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent-postgres-driver.git",
                 from: "2.0.0"),
        .package(url: "https://github.com/vapor/jwt.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/queues.git", from: "1.0.0"),
        .package(url: "https://github.com/vapor/queues-redis-driver.git", from: "1.0.0"),

        
        // Mailgun
        .package(url: "https://github.com/vapor-community/mailgun.git",
                 from: "5.0.0")
    ],
    targets: [
        .executableTarget(
            name: "Monitoring",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver",
                         package: "fluent-postgres-driver"),
               .product(name: "Vapor", package: "vapor"),
               .product(name: "JWT", package: "jwt"),
               .product(name: "QueuesRedisDriver",
                        package: "queues-redis-driver"),
               .product(name: "Mailgun", package: "mailgun"),
//                .product(name: "Leaf", package: "leaf"),
            ]
        ),
        .testTarget(name: "MonitoringTests", dependencies: [
            .target(name: "Monitoring"),
            .product(name: "XCTVapor", package: "vapor"),
            .product(name: "XCTQueues", package: "queues")
        ]),
        .executableTarget(
            name: "Monitored",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver",
                         package: "fluent-postgres-driver"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "JWT", package: "jwt"),
                .product(name: "QueuesRedisDriver",
                         package: "queues-redis-driver"),
                .product(name: "Mailgun", package: "mailgun"),
            ]
        ),
        .testTarget(name: "MonitoredTests", dependencies: [
            .target(name: "Monitored"),
            .product(name: "XCTVapor", package: "vapor"),
            .product(name: "XCTQueues", package: "queues")
        ])
    ]
)
