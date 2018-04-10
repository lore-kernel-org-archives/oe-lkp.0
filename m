Content-Type: multipart/mixed; boundary="===============4692794998912343168=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: d1a5c41252 ("VFS: Implement a filesystem superblock .."): BUG: stack guard page was hit at 000000004414d6e7 (stack is 00000000c64d9cc7..000000003d5db213)
Date: Tue, 10 Apr 2018 11:02:03 +0100
Message-ID: <31028.1523354523@warthog.procyon.org.uk>
In-Reply-To: <5acbca14.rarcWuaa7vHi4kSj%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4692794998912343168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <lkp@intel.com> wrote:

> [    0.334793] BUG: stack guard page was hit at 000000004414d6e7 (stack i=
s 00000000c64d9cc7..000000003d5db213)

Hmmm...  The kernel address scrambler makes these values useless :-/

David

--===============4692794998912343168==--

