Content-Type: multipart/mixed; boundary="===============3464775892650871286=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [KVM] 0c32e5dd82: stderr: KVM: entry failed, hardware error 0x80000021
Date: Tue, 10 Nov 2015 13:29:27 +0800
Message-ID: <87pozibex4.fsf@yhuang-dev.intel.com>
In-Reply-To: <BLU436-SMTP1470E0609C9AAB5FE767A3080140@phx.gbl>
List-Id: <oe-lkp.lists.linux.dev>

--===============3464775892650871286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Wanpeng Li <wanpeng.li@hotmail.com> writes:

> On 11/10/15 9:47 AM, kernel test robot wrote:
>> FYI, we noticed the below changes on
>>
>> https://github.com/0day-ci/linux Wanpeng-Li/KVM-x86-Reset-RFLAGS-state-f=
ollowing-processor-init-reset/20151103-194355
>> commit 0c32e5dd82fd0e63fd9e6aecf5a4bffbdf2ab207 ("KVM: x86: Reset RFLAGS=
 state following processor init/reset")
>>
>> The stderr of kvm-unit-tests is as follow for your commit.
>
> Thanks for the report, however, I don't think maintainer pick this
> patch in any tree currently, which tree you are testing against?

We test patches from LKML directly now :)

Best Regards,
Huang, Ying

--===============3464775892650871286==--

