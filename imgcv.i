%module imgcv

%include "std_string.i"
%include "std_vector.i"

namespace std {
    %template(Features) vector<float>;
}

%{
  #include "imgcv.hpp"
%}


double similarityScore(std::vector<float>, std::vector<float>);


