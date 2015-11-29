#include "imgcv.hpp"

double similarityScore(vector<float> histogram1, vector<float> histogram2) {
    return compareHist(histogram1, histogram2, CV_COMP_INTERSECT);
}
