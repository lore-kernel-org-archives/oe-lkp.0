Content-Type: multipart/mixed; boundary="===============0450368227959449373=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86, sched] 1567c3e346: vm-scalability.median -15.8% regression
Date: Fri, 12 Jun 2020 16:11:13 +0800
Message-ID: <fdcab17c-91aa-fba0-65d1-c08af6f50842@linux.intel.com>
In-Reply-To: <1587018059.32139.22.camel@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============0450368227959449373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Giovanni,

    I test the regression, it still existed in v5.7.  Do you have time =

to take a look at this? Thanks.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/runtime/debug-setup/size/test/c=
pufreq_governor/ucode:
 =

lkp-hsw-4ex1/vm-scalability/debian-x86_64-20191114.cgz/x86_64-rhel-7.6/gcc-=
7/300s/test/8T/anon-cow-seq/performance/0x16

commit:
   2a4b03ffc69f2dedc6388e9a6438b5f4c133a40d
   1567c3e3467cddeb019a7b53ec632f834b6a9239
   v5.7-rc1
   v5.7

2a4b03ffc69f2ded 1567c3e3467cddeb019a7b53ec6                    v5.7-rc1 =

                        v5.7
---------------- --------------------------- --------------------------- =

---------------------------
          %stddev     %change         %stddev     %change =

%stddev     %change         %stddev
              \          |                \          |                \ =

         |                \
     211462           -16.0%     177702           -15.0%     179809 =

      -15.1%     179510        vm-scalability.median
       5.34 =C2=B1  9%      -3.1        2.23 =C2=B1 11%      -2.9        2.=
49 =C2=B1 =

5%      -2.7        2.61 =C2=B1 11%  vm-scalability.median_stddev%
   30430671           -16.3%   25461360           -15.5%   25707029 =

      -15.5%   25701713        vm-scalability.throughput
  7.967e+09           -11.1%  7.082e+09           -11.1%  7.082e+09 =

      -11.1%  7.082e+09        vm-scalability.workload



On 4/16/2020 2:20 PM, Giovanni Gherdovich wrote:
> On Thu, 2020-04-16 at 14:10 +0800, Xing Zhengjun wrote:
>> Hi Giovanni,
>>
>>     1567c3e346("x86, sched: Add support for frequency invariance") has
>> been merged into Linux mainline v5.7-rc1 now. Do you have time to take a
>> look at this? Thanks.
>>
> =

> Apologies, this slipped under my radar. I'm on it, thanks.
> =

> =

> Giovanni Gherdovich
> =


-- =

Zhengjun Xing
--===============0450368227959449373==--

