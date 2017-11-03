Content-Type: multipart/mixed; boundary="===============4486254803681180967=="
MIME-Version: 1.0
From: Frederic Weisbecker <frederic@kernel.org>
To: lkp@lists.01.org
Subject: Re: 3472f16f83 ("workqueue: Use lockdep to assert IRQs are .."): WARNING: CPU: 0 PID: 561 at kernel/workqueue.c:1378 __queue_work
Date: Fri, 03 Nov 2017 03:55:54 +0100
Message-ID: <CAFTL4hyPvVTdz=7y5tbWuAe_jg=V1tszL273mMen7NEaJC_mLg@mail.gmail.com>
In-Reply-To: <20171102045641.p36bm3kbpdm5ypqg@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4486254803681180967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2017-11-02 5:56 UTC+01:00, Fengguang Wu <fengguang.wu@intel.com>:
>>Hi,
>>
>>I've run the reproducer in attachment but it didn't trigger the
>>warning. With the yocto initrd, it doesn't pass the root fs mount and
>>the warning seem to happen at this stage or later in your logs. Am I
>>missing an element from your reproducer environment? It seems to mount
>>an NTFS volume...
>
> Sorry it looks the initrd URL was wrong, would you try this?
>
> rm yocto-trinity-i386.cgz
> wget
> https://github.com/fengguang/reproduce-kernel-bug/raw/master/yocto/yocto-=
trinity-i386.cgz

Perfect! I can now reproduce!

Thanks a lot!

--===============4486254803681180967==--

