Content-Type: multipart/mixed; boundary="===============8772355725985779019=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [scsi] 5c279bd9e4: blogbench.read_score -10.0% regression
Date: Thu, 06 Jul 2017 10:54:21 +0800
Message-ID: <20170706025421.GB5222@yexl-desktop>
In-Reply-To: <CACVXFVNWpWb0f-tp2r82Juzq3QH2Prw_gzqVY9tySnAQsLg2Kg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8772355725985779019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Ming Lei

On 07/06, Ming Lei wrote:
>Hi Xiaolong,
>
>On Mon, Jul 3, 2017 at 10:57 AM, kernel test robot
><xiaolong.ye@intel.com> wrote:
>>
>> Greeting,
>>
>> FYI, we noticed a -10.0% regression of blogbench.read_score due to commi=
t:
>
>Looks like related with mq scheduler, could you test the following patch t=
o see
>if your issue can be fixed?
>
>https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/comm=
it/?h=3Dfor-linus&id=3D32825c45ff8f4cce937ab85b030dc693ceb1aa0a
>

Here is the comparison of commit 5c279bd9e4 and 32825c45, it does help reco=
ver
performance back.

$ compare -at 5c279bd9e40624f4ab6e688671026d6005b066fa 32825c45ff8f4cce937a=
b85b030dc693ceb1aa0a
tests: 1
testcase/path_params/tbox_group/run: blogbench/1SSD-ext4-performance/lkp-bd=
w-de1

5c279bd9e40624f4  32825c45ff8f4cce937ab85b03  =

----------------  --------------------------  =

         %stddev      change         %stddev
             \          |                \  =

    262860              36%     358558        blogbench.read_score
      9913 =C2=B1  4%       -33%       6654        blogbench.write_score
  86266452              31%  1.129e+08        blogbench.time.file_system_in=
puts
     29.89              22%      36.46        blogbench.time.user_time
       214              13%        242        blogbench.time.percent_of_cpu=
_this_job_got
       620              12%        696        blogbench.time.system_time
  1.11e+08             -29%   79019314        blogbench.time.file_system_ou=
tputs
    439016             -69%     135286        blogbench.time.involuntary_co=
ntext_switches
      0.64              22%       0.78        mpstat.cpu.usr%
      7.02 =C2=B1  4%       -47%       3.72        mpstat.cpu.idle%
    237216            1344%    3425183        softirqs.RCU
    430504             376%    2048486        softirqs.TIMER
    188376             211%     586308        softirqs.SCHED
    306478 =C2=B1 32%       -99%       4150 =C2=B1 36%  softirqs.NET_RX
  86266452              31%  1.129e+08        time.file_system_inputs
     29.89              22%      36.46        time.user_time

Thanks,
Xiaolong

>
>Thanks,
>Ming Lei

--===============8772355725985779019==--

