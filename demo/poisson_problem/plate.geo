// Gmsh project created on Fri Mar 19 16:28:15 2021
SetFactory("OpenCASCADE");
Point(1) = {0, 0, 0, 1.0};
Point(2) = {1, 0, 0, 1.0};
Point(3) = {1, 1, 0, 1.0};
Point(4) = {0, 1, 0, 1.0};
Point(5) = {0.2, 0.5, 0, 1.0};
Point(6) = {0.2, 0.7, 0, 1.0};
Point(7) = {1, 0.7, 0, 1.0};
Point(8) = {1, 0.5, 0, 1.0};
Point(11) = {0.2, 0, -0, 1.0};
Point(12) = {0.2, 1, -0, 1.0};
Point(13) = {0, 0.5, 0, 1.0};
Point(14) = {0, 0.7, 0, 1.0};

Line(1) = {1, 11};
Line(2) = {11, 2};
Line(3) = {2, 8};
Line(4) = {8, 7};
Line(5) = {7, 3};
Line(6) = {3, 12};
Line(7) = {12, 4};
Line(8) = {4, 14};
Line(9) = {14, 13};
Line(10) = {13, 1};
Line(11) = {13, 5};
Line(12) = {5, 11};
Line(13) = {14, 6};
Line(14) = {6, 12};
Line(15) = {6, 5};
Line(16) = {5, 8};
Line(17) = {6, 7};

Curve Loop(1) = {6, -14, 17, 5};
Plane Surface(1) = {1};
Curve Loop(2) = {7, 8, 13, 14};
Plane Surface(2) = {2};
Curve Loop(3) = {13, 15, -11, -9};
Plane Surface(3) = {3};
Curve Loop(4) = {11, 12, -1, -10};
Plane Surface(4) = {4};
Curve Loop(5) = {16, -3, -2, -12};
Plane Surface(5) = {5};
Curve Loop(6) = {17, -4, -16, -15};
Plane Surface(6) = {6};


Transfinite Curve {2, 6,16,17} = 9*2*3;
Transfinite Curve {8, 5, 14} = 4*2*3;
Transfinite Curve {7, 9, 11,1, 15, 13, 4} = 3*2*3;
Transfinite Curve {10, 12, 3} = 6*2*3;
Transfinite Surface{1:6};

Physical Surface("Domain") = {1, 2, 3, 4, 5};
Physical Surface("Obstacle") = {6};
Physical Curve("Top") = {6, 7};
Physical Curve("Right") = {5, 4, 3};
Physical Curve("Left") = {8, 9, 10};
Physical Curve("Bottom") = {1, 2};
