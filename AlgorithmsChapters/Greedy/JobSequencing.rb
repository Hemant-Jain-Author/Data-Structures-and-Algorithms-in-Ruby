class JobSequencing
    # Define the accessor of class JobSequencing
    attr_accessor :jobs,:n,:maxDL

    class Job
        # Define the accessor of class Job
        attr_accessor :id,:deadline,:profit

        def initialize( id,  deadline,  profit)
            self.id = id
            self.deadline = deadline
            self.profit = profit
        end
    end

    def initialize( ids,  deadlines,  profits,  n)
        self.jobs = Array.new(n){nil}
        self.n = n
        self.maxDL = deadlines[0]
        i = 1
        while (i < n)
            if (deadlines[i] > self.maxDL)
                self.maxDL = deadlines[i]
            end
            i += 1
        end
        i = 0
        while (i < n)
            self.jobs[i] = Job.new(ids[i], deadlines[i], profits[i])
            i += 1
        end
    end

    def display()
		self.jobs.sort! {|x, y| -x.profit <=> -y.profit}

        result = Array.new(self.maxDL){false}
        job = Array.new(self.maxDL){' '}
        profit = 0
        i = 0
        # Iterate through all given jobs
        while (i < self.n)
            j = self.jobs[i].deadline - 1
            while (j >= 0)
                if (result[j] == false)
                    result[j] = true
                    job[j] = self.jobs[i].id
                    profit += self.jobs[i].profit
                    break
                end
                j -= 1
            end
            i += 1
        end
        print("Profit is :: " + profit.to_s,"\n")
        print("Jobs selected are::")
        i = 0
        while (i < self.maxDL)
            if (job[i] != ' ')
                print(" " + job[i].to_s)
            end
            i += 1
        end
    end
end

# Testing code.
id = ['a', 'b', 'c', 'd', 'e']
deadline = [3, 1, 2, 4, 4]
profit = [50, 40, 27, 31, 30]
js = JobSequencing.new(id, deadline, profit, 5)
js.display()

"""
Profit is :: 151
Jobs selected are:: b e a d
"""