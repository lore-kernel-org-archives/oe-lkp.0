Content-Type: multipart/mixed; boundary="===============7588003821893958931=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: [ipc] 61224adcd2: general_protection_fault:#[##]
Date: Thu, 13 Sep 2018 12:28:41 +0100
Message-ID: <23069.1536838121@warthog.procyon.org.uk>
In-Reply-To: <20180913010517.GB7632@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7588003821893958931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <rong.a.chen@intel.com> wrote:

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email

Tried that.  That seems to work for me.  Or, at least, it comes to a prompt=
 at
which I can log in.  I'm not sure whether anything else is meant to happen.

David

--===============7588003821893958931==--

