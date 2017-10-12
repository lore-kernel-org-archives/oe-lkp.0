Content-Type: multipart/mixed; boundary="===============3236402273667832257=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Thu, 12 Oct 2017 17:28:13 +0800
Message-ID: <20171012092813.wy6yqvmrqstwrkjn@wfg-t540p.sh.intel.com>
In-Reply-To: <20171012092155.eujxes7f5k2fcjhp@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3236402273667832257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>>[   35.721719] Kernel panic - not syncing: No working init found.  Try pa=
ssing init=3D option to kernel. See Linux Documentation/admin-guide/init.rs=
t for guidance.
>
>Well I got the same result. The script and initrd image matches well
>with my local version. I'll dig what goes wrong.
>
>>And it did download that initrd thingy...
>>
>>$ shasum openwrt-trinity-i386.cgz
>>0a405d02a162defd82a5ffd556fd24e0ee2f994a  openwrt-trinity-i386.cgz
>>
>>
>>Anything else I need?

Oops, we downloaded the wrong URL.

% du openwrt-trinity-i386.cgz
4.0K    openwrt-trinity-i386.cgz

Please try this:

rm openwrt-trinity-i386.cgz
wget https://github.com/fengguang/reproduce-kernel-bug/raw/master/openwrt/o=
penwrt-trinity-i386.cgz

Thanks,
Fengguang

--===============3236402273667832257==--

