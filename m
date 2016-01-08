Content-Type: multipart/mixed; boundary="===============1406775232753889481=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/vmstat] 6cdb18ad98: -8.5% will-it-scale.per_thread_ops
Date: Fri, 08 Jan 2016 13:24:30 +0800
Message-ID: <87mvsgfxtd.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160107112301.GE4062@osiris>
List-Id: <oe-lkp.lists.linux.dev>

--===============1406775232753889481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Heiko Carstens <heiko.carstens@de.ibm.com> writes:

> On Wed, Jan 06, 2016 at 11:20:55AM +0800, kernel test robot wrote:
>> FYI, we noticed the below changes on
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> commit 6cdb18ad98a49f7e9b95d538a0614cde827404b8 ("mm/vmstat: fix overflo=
w in mod_zone_page_state()")
>> =

>> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
>>   gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/ivb42/pre=
ad1/will-it-scale
>> =

>> commit: =

>>   cc28d6d80f6ab494b10f0e2ec949eacd610f66e3
>>   6cdb18ad98a49f7e9b95d538a0614cde827404b8
>> =

>> cc28d6d80f6ab494 6cdb18ad98a49f7e9b95d538a0 =

>> ---------------- -------------------------- =

>>          %stddev     %change         %stddev
>>              \          |                \  =

>>    2733943   0%      -8.5%    2502129   0%  will-it-scale.per_thread_ops
>>       3410   0%      -2.0%       3343   0%  will-it-scale.time.system_ti=
me
>>     340.08   0%     +19.7%     406.99   0%  will-it-scale.time.user_time
>>   69882822   2%     -24.3%   52926191   5%  cpuidle.C1-IVT.time
>>     340.08   0%     +19.7%     406.99   0%  time.user_time
>>     491.25   6%     -17.7%     404.25   7%  numa-vmstat.node0.nr_alloc_b=
atch
>>       2799  20%     -36.6%       1776   0%  numa-vmstat.node0.nr_mapped
>>     630.00 140%    +244.4%       2169   1%  numa-vmstat.node1.nr_inactiv=
e_anon
>
> Hmm... this is odd. I did review all callers of mod_zone_page_state() and
> couldn't find anything obvious that would go wrong after the int -> long
> change.
>
> I also tried the "pread1_threads" test case from
> https://github.com/antonblanchard/will-it-scale.git
>
> However the results seem to vary a lot after a reboot(!), at least on s39=
0.
>
> So I'm not sure if this is really a regression.

The test is quite stable for my side.  We run the test case 7 times for
your commit and its parent.  The standard variation is very low.

you commit:

[2493136, 2510964, 2508784, 2495632, 2506735, 2503016, 2510121]

parent commit:

[2735669, 2719566, 2739052, 2741485, 2735152, 2739356, 2739125]

The test result is stable for bisection too.  The below figure show the
results of good commits and bad commits.  The distance between is quite
big.  And the variation is quite small.

                             will-it-scale.per_thread_ops

  2.75e+06 ++--*---*--------------*---*------*---*---*-*-*-*----------*---*=
-+
           *.*  + + +  .*. .*.*.*  + + + .*.* + + + +        *.*.**.*   *  =
 *
   2.7e+06 ++    *   **   *         *   *      *   *                       =
 |
           |                                                               =
 |
           |                                                               =
 |
  2.65e+06 ++                                                              =
 |
           |                                                               =
 |
   2.6e+06 ++                                                              =
 |
           |                                                               =
 |
  2.55e+06 ++                                                              =
 |
           |                                                               =
 |
           O O O O      O O   O   O O   O   O  O O   O   O                 =
 |
   2.5e+06 ++      O OO     O   O     O   O  O     O   O                   =
 |
           |                                                               =
 |
  2.45e+06 ++--------------------------------------------------------------=
-+


FYI, I test your patch on x86 platform.  I have no s390 system.

Best Regards,
Huang, Ying

--===============1406775232753889481==--

