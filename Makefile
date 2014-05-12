CXXFLAGS = -O3 -ftree-vectorize -march=native -pthread -Wall -I${HOME}/include `pkg-config --cflags opencv` -I/opt/local/include -I./
#CXXFLAGS = -g -ggdb -pthread -Wall -I${HOME}/include `pkg-config --cflags opencv` -I/opt/local/include
LIBS = -L./Tisean -L${HOME}/lib -L/usr/lib -lann -lddtsa `pkg-config --libs opencv` 
TARGETS = $(buildtree_TARGET) $(classifytrajectory_TARGET)
OBJS = $(buildtree_OBJS) $(classifytrajectory_OBJS)
CXX = g++

buildtree_TARGET = buildtree
buildtree_OBJS = BuildTree.o TDEModel.o Utils.o
$(buildtree_TARGET): $(buildtree_OBJS)
	$(CXX) $(CXXFLAGS) -o $(buildtree_TARGET) $(buildtree_OBJS) $(LIBS)

classifytrajectory_TARGET = classifytrajectory
classifytrajectory_OBJS = ClassifyTrajectory.o Classifier.o TDEModel.o Utils.o
$(classifytrajectory_TARGET): $(classifytrajectory_OBJS)
	$(CXX) $(CXXFLAGS) -o $(classifytrajectory_TARGET) $(classifytrajectory_OBJS) $(LIBS)

all:	$(TARGETS)

clean:
	rm -f $(OBJS) $(TARGETS)
