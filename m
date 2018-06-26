Content-Type: multipart/mixed; boundary="===============0582468385079147037=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [bisect done] ace45bec6d [ 52.056290] EIP: lock_release
Date: Tue, 26 Jun 2018 14:25:00 +0100
Message-ID: <32692.1530019500@warthog.procyon.org.uk>
In-Reply-To: <20180626010626.GG11011@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0582468385079147037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <lkp@intel.com> wrote:

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit ace45bec6d77bc061c3c3d8ad99e298ea9800c2b
> Author:     David Howells <dhowells@redhat.com>
> AuthorDate: Fri Mar 30 21:04:43 2018 +0100
> Commit:     David Howells <dhowells@redhat.com>
> CommitDate: Fri Mar 30 21:04:43 2018 +0100
> =

>     rxrpc: Fix firewall route keepalive

Are you actually making AF_RXRPC or the AFS filesystem do anything?  Or is =
it
just happening spontaneously?

David

--===============0582468385079147037==--

