Content-Type: multipart/mixed; boundary="===============6621275145792796107=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [driver core] 570d020012: will-it-scale.per_thread_ops -12.2% regression
Date: Tue, 19 Feb 2019 13:19:04 +0100
Message-ID: <20190219121904.GA24103@kroah.com>
In-Reply-To: <20190219005945.GA16734@richard>
List-Id: <oe-lkp.lists.linux.dev>

--===============6621275145792796107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 19, 2019 at 08:59:45AM +0800, Wei Yang wrote:
> On Mon, Feb 18, 2019 at 03:54:42PM +0800, kernel test robot wrote:
> >Greeting,
> >
> >FYI, we noticed a -12.2% regression of will-it-scale.per_thread_ops due =
to commit:
> >
> >
> >commit: 570d0200123fb4f809aa2f6226e93a458d664d70 ("driver core: move dev=
ice->knode_class to device_private")
> >https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> >
> =

> This is interesting.
> =

> I didn't expect the move of this field will impact the performance.
> =

> The reason is struct device is a hotter memory than device->device_privat=
e?
> =

> >in testcase: will-it-scale
> >on test machine: 288 threads Knights Mill with 80G memory
> >with following parameters:
> >
> >	nr_task: 100%
> >	mode: thread
> >	test: unlink2
> >	cpufreq_governor: performance
> >
> >test-description: Will It Scale takes a testcase and runs it from 1 thro=
ugh to n parallel copies to see if the testcase will scale. It builds both =
a process and threads based test in order to see any differences between th=
e two.
> >test-url: https://github.com/antonblanchard/will-it-scale
> >
> >In addition to that, the commit also has significant impact on the follo=
wing tests:
> >
> >+------------------+----------------------------------------------------=
-----------+
> >| testcase: change | will-it-scale: will-it-scale.per_thread_ops -29.9% =
regression |
> >| test machine     | 288 threads Knights Mill with 80G memory           =
           |
> >| test parameters  | cpufreq_governor=3Dperformance                     =
             |
> >|                  | mode=3Dthread                                      =
             |
> >|                  | nr_task=3D100%                                     =
             |
> >|                  | test=3Dsignal1                                     =
             |

Ok, I'm going to blame your testing system, or something here, and not
the above patch.

All this test does is call raise(3).  That does not touch the driver
core at all.

> >+------------------+----------------------------------------------------=
-----------+
> >| testcase: change | will-it-scale: will-it-scale.per_thread_ops -16.5% =
regression |
> >| test machine     | 288 threads Knights Mill with 80G memory           =
           |
> >| test parameters  | cpufreq_governor=3Dperformance                     =
             |
> >|                  | mode=3Dthread                                      =
             |
> >|                  | nr_task=3D100%                                     =
             |
> >|                  | test=3Dopen1                                       =
             |
> >+------------------+----------------------------------------------------=
-----------+

Same here, open1 just calls open/close a lot.  No driver core
interaction at all there either.

So are you _sure_ this is the offending patch?

thanks,

greg k-h

--===============6621275145792796107==--

