src := $(wildcard headers/*.cpp)
obj := $(patsubst %.cpp,%.o,$(src))
dep := $(patsubst %.o,%.d,$(obj))

libhdr.a: $(obj)
	$(AR) rcsT $@ $^

headers/%.o: headers/%.cpp
	$(CXX) -MD $(CPPFLAGS) -std=c++2a $(CXXFLAGS) -o $@ -c $<

.PHONY: clean
clean:
	rm -f $(dep)
	rm -f $(obj)
	rm -f libhdr.a
