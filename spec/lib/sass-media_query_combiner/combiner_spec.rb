require 'spec_helper'
require 'sassc/media_query_combiner/combiner'

describe Sassc::MediaQueryCombiner::Combiner do
  it "should handle keyframes in media queries" do
    Timeout::timeout(0.5) do
      Sassc::MediaQueryCombiner::Combiner.combine <<CSS
@media (min-width: 40em) {
  @-webkit-keyframes whatever {}
}
CSS
    end
  end

  it "should handle debug info" do
    Timeout::timeout(0.5) do
      Sassc::MediaQueryCombiner::Combiner.combine <<CSS
@media (max-width: 480px) {
@media -sass-debug-info {filename{}line{}}
  h1 {
    color: red; } }
CSS
    end
  end
end
