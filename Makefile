CXXFLAGS = -O3 -ftree-vectorize -march=native -pthread -Wall -I${HOME}/include `pkg-config --cflags opencv` -I/opt/local/include -I./
#CXXFLAGS = -g -ggdb -pthread -Wall -I${HOME}/include `pkg-config --cflags opencv` -I/opt/local/include
LIBS = -L./Tisean -L${HOME}/lib -L/usr/lib -lann -lddtsa `pkg-config --libs opencv` 

buildtree_TARGET = buildtree
buildtree_OBJS = BuildTree.o TDEModel.o Utils.o
classifytrajectory_TARGET = classifytrajectory
classifytrajectory_OBJS = ClassifyTrajectory.o Classifier.o TDEModel.o Utils.o

TARGETS = $(buildtree_TARGET) $(classifytrajectory_TARGET)
OBJS = $(buildtree_OBJS) $(classifytrajectory_OBJS)
CXX = g++

all:	buildtree classifytrajectory

buildtree: $(buildtree_OBJS)
	$(CXX) $(CXXFLAGS) -o $(buildtree_TARGET) $(buildtree_OBJS) $(LIBS)

classifytrajectory: $(classifytrajectory_OBJS)
	$(CXX) $(CXXFLAGS) -o $(classifytrajectory_TARGET) $(classifytrajectory_OBJS) $(LIBS)

clean:
	rm -f $(OBJS) $(TARGETS)
