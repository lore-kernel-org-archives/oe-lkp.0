Content-Type: multipart/mixed; boundary="===============6627129396268457273=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: 1d03958188: WARNING:at_lib/vsprintf.c:#format_decode
Date: Fri, 05 Jul 2019 09:17:24 +0100
Message-ID: <13851.1562314644@warthog.procyon.org.uk>
In-Reply-To: <20190705072547.GB17490@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6627129396268457273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <rong.a.chen@intel.com> wrote:

> [   31.652058] WARNING: CPU: 1 PID: 947 at lib/vsprintf.c:2359 format_dec=
ode+0x3dd/0x3f0

Was there more to the warning message than this?

Looking at that line, it would appear to be:

		WARN_ONCE(1, "Please remove unsupported %%%c in format string\n", *fmt);

which should print a message.

The only format string in my patch is:

+               modname =3D kasprintf(GFP_KERNEL, "key-type-%s", type);

which there doesn't appear to be a problem with.

David

--===============6627129396268457273==--

