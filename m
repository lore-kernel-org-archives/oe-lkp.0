Content-Type: multipart/mixed; boundary="===============9124411293132050993=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf] a0ab2bff12: stderr.Error_opening, size=#Permission_denied
Date: Wed, 20 Nov 2019 21:56:54 +0800
Message-ID: <20191120135654.GA4261@xsang-OptiPlex-9020>
In-Reply-To: <874kyzdodx.fsf@ashishki-desk.ger.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9124411293132050993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2019 at 08:59:22AM +0200, Alexander Shishkin wrote:
> kernel test robot <oliver.sang@intel.com> writes:
> =

> > FYI, we noticed the following commit (built with gcc-7):
> >
> > commit: a0ab2bff124063e988fe6e754bef8de83d8df1ce ("perf: Allow using AU=
X data in perf samples")
> > https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git perf/cgro=
up
> >
> > in testcase: perf_event_tests
> > with following parameters:
> >
> > 	paranoid: disallow_raw_tracepoint
> > 	ucode: 0x27
> >
> > test-description: The Perf Event Testsuite.
> > test-url: https://github.com/deater/perf_event_tests
> >
> >
> > on test machine: 8 threads Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz with=
 8G memory
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> =

> How do I interpret this? Can you point to the place that's failing?

Hi Alex, sorry for confusion, the error is as below
  + tests/size/too_big
    Testing attr > kernel supported size...                    FAILED

it can pass with parent commit

dfec05e968f85ebf  a0ab2bff124063e988fe6e754b
----------------  --------------------------  =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :12         100%          12:12    perf_event_tests.too_big.fail=
ed


> =

> Thanks,
> --
> Alex
--===============9124411293132050993==--

