Content-Type: multipart/mixed; boundary="===============4451522255531908238=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [fs] a0918006f9: netperf.Throughput_tps -11.6% regression
Date: Fri, 12 Nov 2021 20:25:14 +0800
Message-ID: <c6d3b7c2-4724-4dec-d29a-dee8f7e8cfc8@intel.com>
In-Reply-To: <202111090920.4958E610D1@keescook>
List-Id: <oe-lkp.lists.linux.dev>

--===============4451522255531908238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On 11/10/2021 1:21 AM, Kees Cook wrote:
>> I suppose these three CPUs have different cache policy. It also could be
>> related with netperf throughput testing.
> Does moving the syscall implementation somewhere else change things?
I moved the syscall implementation to a stand alone file and put the file
to net directory for testing. The new patch is like:
https://zerobin.net/?a2b782afadf3c428#Me8l4AJuhiSCfaLVWVzydAVIK6ves0EVIVD76=
wLnVQo=3D


The test result is like following:
     - on Cascade Lake: -10.4%
    356365           -10.4%     319180        netperf.Throughput_total_tps
     22272           -10.4%      19948        netperf.Throughput_tps


     - on Cooper Lake: -4.0%
    345772 =C2=B1  4%      -4.0%     331814        netperf.Throughput_total=
_tps
     21610 =C2=B1  4%      -4.0%      20738        netperf.Throughput_tps


     - on Ice Lake: -1.1%
    509824            -1.1%     504434        netperf.Throughput_total_tps
     31864            -1.1%      31527        netperf.Throughput_tps


Regards
Yin, Fengwei
--===============4451522255531908238==--

