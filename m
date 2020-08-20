Content-Type: multipart/mixed; boundary="===============1646794451237025995=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [clk] a2499eff4b: BUG:kernel_NULL_pointer_dereference, address
Date: Thu, 20 Aug 2020 13:03:27 +0800
Message-ID: <be4c9098-98a2-e9c0-b787-57fa7d7da24f@intel.com>
In-Reply-To: <159780681339.334488.10402512224012716827@swboyd.mtv.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1646794451237025995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 8/19/20 11:13 AM, Stephen Boyd wrote:
> Quoting kernel test robot (2020-08-11 01:49:44)
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-9):
>>
>> commit: a2499eff4b30a85d56e4466e6ca4746c72a347c6 ("[PATCH v2] clk: samsu=
ng: Keep top BPLL mux on Exynos542x enabled")
>> url: https://github.com/0day-ci/linux/commits/Marek-Szyprowski/clk-samsu=
ng-Keep-top-BPLL-mux-on-Exynos542x-enabled/20200807-213239
>> base: https://git.kernel.org/cgit/linux/kernel/git/clk/linux.git clk-next
>>
>> in testcase: trinity
>> with following parameters:
>>
>>          runtime: 300s
>>
>> test-description: Trinity is a linux system call fuzz tester.
>> test-url: http://codemonkey.org.uk/projects/trinity/
>>
>>
>> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m=
 16G
> Cool robot. But this doesn't look related to the patch at all?

Hi Stephen,

Sorry for the inconvenience, you are right, we run more times
on the parent commit and can reproduce the error too.

Best Regards,
Rong Chen


--===============1646794451237025995==--

