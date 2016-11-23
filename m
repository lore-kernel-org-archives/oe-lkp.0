Content-Type: multipart/mixed; boundary="===============0640279681867094096=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [block] ef295ecf09: [No primary change] iostat.sda.avgqu-sz +4.4% increase
Date: Wed, 23 Nov 2016 17:06:45 +0800
Message-ID: <20161123090645.trr75otmrnhqklrl@wfg-t540p.sh.intel.com>
In-Reply-To: <20161123083913.GC16966@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============0640279681867094096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Wed, Nov 23, 2016 at 09:39:14AM +0100, Christoph Hellwig wrote:
>On Wed, Nov 23, 2016 at 10:30:26AM +0800, kernel test robot wrote:
>>
>> Greeting,
>>
>> There is no primary kpi change in this test, below is the data collected=
 through multiple monitors running background just for your information.
>
>Do you have any explanation of what this mail actually means?  I have
>a hard time understanding it.

This is not a bug report, but serve as feedback about
"here is a behavior change associated with this patch".

We find commit ef295ecf09 ("block: better op and flags encoding")
reliably increases iostat's "avgqu-sz" by 4.4% in the fileio test.
During the test we run iostat in the background to monitor IO stats.
There is no throughput/latency etc. critical changes found.

Thanks,
Fengguang

--===============0640279681867094096==--

