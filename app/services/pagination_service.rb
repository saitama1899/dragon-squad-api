class PaginationService
  def self.call(objects[],pagNum,sliceNum)
    startIndex=pagNum*sliceNum-1
    finalIndex=startIndex+sliceNum-1
    result=[]
    newPagNum=pagNum
    if (objects.fetch(finalIndex,false)) do
      result=objects.slice!(startIndex..finalIndex)
      newPagNum=pagNum+1
    else
      result=objects.slice!(startIndex..objects.size)
    end
    print "stats of PaginationService array size:#{result.size}|startIndex:#{startIndex}|lastIndex#{lastIndex}|new pagNum #{newPagNum}|last pagnum#{pagNum}"
    return result,newPagNum
  end
end
