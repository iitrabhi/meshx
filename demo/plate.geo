// Gmsh project created on Thu Nov 12 13:40:16 2020
cell_size = 3;
Point(1) = {0, 0, 0, 1.0};
Point(2) = {0, 40, 0, 1.0};
Point(3) = {0, 40, 41, 1.0};
Point(4) = {0, 0, 41, 1.0};
Point(5) = {0, 40, 45, 1.0};
Point(6) = {0, 0, 45, 1.0};
Point(7) = {0, 40, 90, 1.0};
Point(8) = {0, 0, 90, 1.0};
Point(9) = {0, 10, 45, 1.0};
Point(10) = {0, 10, 70, 1.0};
Point(11) = {0, 30, 45, 1.0};
Point(12) = {0, 30, 70, 1.0};

Point(13) = {0, 10, 90, 1.0};
Point(14) = {0, 30, 90, 1.0};

Point(16) = {0, 0, 70, 1.0};
Point(17) = {0, 40, 70, 1.0};

Point(18) = {0, 10, 41, 1.0};
Point(19) = {0, 30, 41, 1.0};

Point(20) = {0, 10, 0, 1.0};
Point(21) = {0, 30, 0, 1.0};


Line(1) = {2, 21};
Line(2) = {3, 19};
Line(3) = {5, 11};
Line(4) = {17, 12};
Line(5) = {7, 14};
Line(6) = {20, 1};
Line(7) = {18, 4};
Line(8) = {9, 6};
Line(9) = {10, 16};
Line(10) = {13, 8};
Transfinite Curve {1:10} = 10/cell_size;
Line(11) = {21, 20};
Line(12) = {19, 18};
Line(13) = {11, 9};
Line(14) = {12, 10};
Line(15) = {14, 13};
Transfinite Curve {11:15} = 20/cell_size;
Line(16) = {2, 3};
Line(17) = {21, 19};
Line(18) = {20, 18};
Line(19) = {1, 4};
Transfinite Curve {16:19} = 41/cell_size;
Line(20) = {3, 5};
Line(21) = {19, 11};
Line(22) = {18, 9};
Line(23) = {4, 6};
Transfinite Curve {20:23} = 4/cell_size;
Line(24) = {5, 17};
Line(25) = {11, 12};
Line(26) = {9, 10};
Line(27) = {6, 16};
Transfinite Curve {24:27} = 25/cell_size;
Line(28) = {17, 7};
Line(29) = {12, 14};
Line(30) = {10, 13};
Line(31) = {16, 8};
Transfinite Curve {28:31} = 20/cell_size;

Curve Loop(1) = {16, 2, -17, -1};
Plane Surface(1) = {1};
Curve Loop(2) = {20, 3, -21, -2};
Plane Surface(2) = {2};
Curve Loop(3) = {24, 4, -25, -3};
Plane Surface(3) = {3};
Curve Loop(4) = {28, 5, -29, -4};
Plane Surface(4) = {4};
Curve Loop(5) = {29, 15, -30, -14};
Plane Surface(5) = {5};
Curve Loop(6) = {30, 10, -31, -9};
Plane Surface(6) = {6};
Curve Loop(7) = {26, 9, -27, -8};
Plane Surface(7) = {7};
Curve Loop(8) = {22, 8, -23, -7};
Plane Surface(8) = {8};
Curve Loop(9) = {13, -22, -12, 21};
Plane Surface(9) = {9};
Curve Loop(10) = {17, 12, -18, -11};
Plane Surface(10) = {10};
Curve Loop(11) = {18, 7, -19, -6};
Plane Surface(11) = {11};
Transfinite Surface{1:11};
//Recombine Surface{1:11};

Extrude {58, 0, 0} {
  Surface{1}; Surface{2}; Surface{3}; Surface{4}; Surface{5}; Surface{6}; Surface{7}; Surface{8}; Surface{9}; Surface{10}; Surface{11}; 
  Layers{58/cell_size};
  //Recombine;
}
Extrude {4, 0, 0} {
  Surface{273}; Surface{251}; Surface{53}; Surface{185}; Surface{163}; Surface{141}; Surface{119}; Surface{97}; Surface{229}; Surface{75}; Surface{207}; 
  Layers{4/cell_size};
  //Recombine;
}

Extrude {238, 0, 0} {
  Surface{339}; Surface{317}; Surface{295}; Surface{515}; Surface{471}; Surface{493}; Surface{361}; Surface{449}; Surface{427}; Surface{405}; Surface{383}; 
  Layers{238/cell_size};
  //Recombine;
}

Extrude {4, 0, 0} {
  Surface{735}; Surface{757}; Surface{713}; Surface{691}; Surface{647}; Surface{537}; Surface{559}; Surface{581}; Surface{625}; Surface{603}; Surface{669}; 
  Layers{4/cell_size};
  //Recombine;
}

Extrude {58, 0, 0} {
  Surface{801}; Surface{779}; Surface{823}; Surface{845}; Surface{999}; Surface{933}; Surface{911}; Surface{889}; Surface{867}; Surface{955}; Surface{977}; 
  Layers{58/cell_size};
  //Recombine;
}

Physical Surface("support",1) = {932, 910, 888, 294, 316, 338};
Physical Surface("load",2) = {1206, 942, 612, 216, 458};
Physical Volume("road",3) = {53, 54, 55, 38, 42, 43, 28, 27, 26, 21, 20, 22, 2, 9, 8};
Physical Volume("domain",4) = {52, 51, 50, 53, 54, 55, 49, 48, 47, 46, 45, 35, 34, 36, 37, 44, 43, 42, 38, 39, 40, 41, 25, 24, 23, 28, 27, 26, 29, 30, 31, 32, 33, 16, 17, 18, 19, 15, 22, 21, 20, 12, 13, 14, 11, 10, 1, 2, 9, 8, 7, 3, 4, 5, 6};
