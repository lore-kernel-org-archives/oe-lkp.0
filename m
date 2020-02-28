Content-Type: multipart/mixed; boundary="===============8432284050311808280=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [KVM] a06230b62b: kvm-unit-tests.vmx.fail
Date: Fri, 28 Feb 2020 15:54:19 +0800
Message-ID: <8b9491a2-85a2-1dd0-bc06-26831ba2d6d6@intel.com>
In-Reply-To: <96533a86-feca-ace8-952b-7e5c88732ee5@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8432284050311808280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2/28/20 3:51 PM, Paolo Bonzini wrote:
> On 28/02/20 08:44, kernel test robot wrote:
>> =1B[31mFAIL=1B[0m vmx (408415 tests, 3 unexpected failures, 2 expected f=
ailures, 5 skipped)
> Please include the commit of kvm-unit-tests that you are using. You are
> likely missing "vmx: tweak XFAILS for #DB test".
>
> Paolo
>

Hi Paolo,

Many thanks for your help, we'll update it and test again.

Best Regards,
Rong Chen
--===============8432284050311808280==--

