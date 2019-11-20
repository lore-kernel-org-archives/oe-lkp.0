Content-Type: multipart/mixed; boundary="===============5275790108591454549=="
MIME-Version: 1.0
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [perf] a0ab2bff12: stderr.Error_opening, size=#Permission_denied
Date: Wed, 20 Nov 2019 08:59:22 +0200
Message-ID: <874kyzdodx.fsf@ashishki-desk.ger.corp.intel.com>
In-Reply-To: <20191120061330.GA1549@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5275790108591454549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <oliver.sang@intel.com> writes:

> FYI, we noticed the following commit (built with gcc-7):
>
> commit: a0ab2bff124063e988fe6e754bef8de83d8df1ce ("perf: Allow using AUX =
data in perf samples")
> https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git perf/cgroup
>
> in testcase: perf_event_tests
> with following parameters:
>
> 	paranoid: disallow_raw_tracepoint
> 	ucode: 0x27
>
> test-description: The Perf Event Testsuite.
> test-url: https://github.com/deater/perf_event_tests
>
>
> on test machine: 8 threads Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz with 8=
G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

How do I interpret this? Can you point to the place that's failing?

Thanks,
--
Alex
--===============5275790108591454549==--

