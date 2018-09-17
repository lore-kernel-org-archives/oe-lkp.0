Content-Type: multipart/mixed; boundary="===============0243491541149585512=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [linux] c208f0c9ab: general_protection_fault:#[##]
Date: Tue, 18 Sep 2018 07:57:27 +0800
Message-ID: <8d262b01-0e70-ebe5-85ac-28eee4800d36@intel.com>
In-Reply-To: <32731.1537227904@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0243491541149585512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 09/18/2018 07:45 AM, David Howells wrote:
> Andrew Morton <akpm@linux-foundation.org> wrote:
>
>>> [   50.838927] RIP: 0010:mqueue_get_tree+0x2c/0xb0
> Could you get me a disassembly of mqueue_get_tree()?
$ faddr2line ./vmlinux mqueue_get_tree+0x2c
mqueue_get_tree+0x2c/0xa3:
mqueue_get_tree at ipc/mqueue.c:362

Best Regards,
Rong Chen

--===============0243491541149585512==--

