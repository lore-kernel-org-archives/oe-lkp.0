Content-Type: multipart/mixed; boundary="===============9159453750094733661=="
MIME-Version: 1.0
From: Dave Chinner <dchinner@redhat.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 610125ab1e: fsmark.app_overhead -71.2% improvement
Date: Mon, 09 Sep 2019 15:32:36 +1000
Message-ID: <20190909053236.GP2254@rh>
In-Reply-To: <20190909015849.GN15734@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============9159453750094733661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2019 at 09:58:49AM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -71.2% improvement of fsmark.app_overhead due to commit:

A negative improvement? That's somewhat ambiguous...

> 0e822255f95db400 610125ab1e4b1b48dcffe74d9d8 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>  1.095e+08           -71.2%   31557568        fsmark.app_overhead
>       6157           +95.5%      12034        fsmark.files_per_sec

So, the files/s rate doubled, and the amount of time spent in
userspace by the fsmark app dropped by 70%.

>     167.31           -47.3%      88.25        fsmark.time.elapsed_time
>     167.31           -47.3%      88.25        fsmark.time.elapsed_time.max

Wall time went down by 50%.

>      91.00            -8.8%      83.00        fsmark.time.percent_of_cpu_=
this_job_got
>     148.15           -53.2%      69.38        fsmark.time.system_time

As did system CPU.

IOWs, this change has changed create performance by a factor of 4 -
the file create is 2x faster for half the CPU spent.

I don't think this is a negative improvement - it's a large positive
improvement.  I suspect that you need to change the metric
classifications for this workload...

Cheers,

Dave.
-- =

Dave Chinner
dchinner(a)redhat.com

--===============9159453750094733661==--

