Content-Type: multipart/mixed; boundary="===============1004113035852799422=="
MIME-Version: 1.0
From: Fengguang Wu <lkp@intel.com>
To: lkp@lists.01.org
Subject: Re: 77ef56e4f0 ("x86: Enable 5-level paging support via CONFIG_X86_5LEVEL=y"): BUG: kernel hang in early-boot stage, last printk: Unable to boot - please use a kernel appropriate for your CPU.
Date: Wed, 04 Oct 2017 08:36:03 +0800
Message-ID: <20171004003603.g65od772xezl2dpf@wfg-t540p.sh.intel.com>
In-Reply-To: <20170926014528.osybisc6k62ewxqq@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1004113035852799422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Philip, would you make this P1 priority?

This issue effectively disabled a large portion of our boot tests.

On Tue, Sep 26, 2017 at 09:45:28AM +0800, LKP wrote:
>On Tue, Sep 26, 2017 at 09:25:56AM +0800, Fengguang Wu wrote:
>>FYI. We'll either need to upgrade to qemu-2.9 (which supports 5-level
>>paging) or disable CONFIG_X86_5LEVEL.
>
>We may either install packages here:
>
>https://debian.pkgs.org/sid/debian-main-amd64/qemu_2.10.0+dfsg-1_amd64.deb=
.html
>
>or use custom build qemu by 0day:
>
>inn:/pkg/qemu/x86_64-softmmu/
>
>Thanks,
>Fengguang

--===============1004113035852799422==--

