Content-Type: multipart/mixed; boundary="===============3799032091072786757=="
MIME-Version: 1.0
From: Li Zhijian <zhijianx.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [ipc] 61224adcd2: general_protection_fault:#[##]
Date: Tue, 18 Sep 2018 22:47:07 +0800
Message-ID: <3905bb1b-c691-0c8b-490f-599e7a0d561b@intel.com>
In-Reply-To: <9499.1537266023@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============3799032091072786757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 9/18/2018 6:20 PM, David Howells wrote:
> Li Zhijian <zhijianx.li@intel.com> wrote:
>
>> this is not expected.
>> could you list/home/dhowells/.lkp/cache
> final_initrd  initrd-concatenated  lkp/  lkp-x86_64-ad88cb1a437a_.cgz  os=
image/
>
> Note that ~/.lkp is a symlink to somewhere that I don't mind clobbering.
>
> Does this assume that I'm running on some particular OS other than Fedora?

sorry, i cannot reproduce your issue on debian and ubuntu

1. please type following command to verify the lkp-src
$ gzip -dc /home/dhowells/.lkp/cache/lkp-x86_64-ad88cb1a437a_.cgz | cpio -t

it should have something like
lizhijian(a)ivb44:~$ gzip -dc .lkp/cache/lkp-x86_64-ebf5822e1818_.cgz | cpi=
o -t | head
lkp
lkp/lkp
lkp/lkp/src
lkp/lkp/src/COPYING
lkp/lkp/src/Gemfile
lkp/lkp/src/Makefile
lkp/lkp/src/README.md
lkp/lkp/src/Rakefile
lkp/lkp/src/_config.yml
lkp/lkp/src/allot

2. remove this file and try again with following changes
lizhijian(a)ivb44:/lkp-qemu/lkp-tests$ git diff
diff --git a/pack/lkp-src b/pack/lkp-src
index 793084cb..ca8717e9 100755
--- a/pack/lkp-src
+++ b/pack/lkp-src
@@ -1,5 +1,5 @@
  #!/bin/bash
-
+set -x
  LKP_SRC=3D${LKP_SRC:-/lkp/$USER/src}
  export ARCH=3D${arch:-x86_64}
  LKP_USER=3D${LKP_USER:-$USER}



Thanks
  =


>
> David

--===============3799032091072786757==--

