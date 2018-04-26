Content-Type: multipart/mixed; boundary="===============2680478481396552457=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: 61f7875c75 ("resource: Use list_head to link sibling resource"): BUG: unable to handle kernel paging request at ffffffe0
Date: Thu, 26 Apr 2018 11:36:32 +0800
Message-ID: <20180426033632.mxhen7wcfnpvavn4@wfg-t540p.sh.intel.com>
In-Reply-To: <20180426032714.GB19030@localhost.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============2680478481396552457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>> Your dmesg says:
>>
>>        >[    9.320297] Failed to execute /init (error -8)
>>        >[    9.321178] Starting init: /sbin/init exists but couldn't exe=
cute it (error -8)
>>        >[    9.322566] Starting init: /bin/sh exists but couldn't execut=
e it (error -8)
>>
>> So it's likely the problem lies in image. What's the size and md5sum
>> of your downloaded openwrt-trinity-i386.cgz?
>
>Sorry, Fengguang, my testing machine located in redhat beaker system is
>withdrew. I am applying a new one, will retry and check the size and
>md5sum and reply asap.

OK. Take your time. :)

Thanks,
Fengguang

--===============2680478481396552457==--

