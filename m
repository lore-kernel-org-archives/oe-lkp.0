Content-Type: multipart/mixed; boundary="===============2334691036195523660=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: [iov_iter] 9bd0e337c6: will-it-scale.per_process_ops -4.8% regression
Date: Fri, 04 Dec 2020 11:51:48 +0000
Message-ID: <98294.1607082708@warthog.procyon.org.uk>
In-Reply-To: <20201203064536.GE27350@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2334691036195523660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <oliver.sang@intel.com> wrote:

> FYI, we noticed a -4.8% regression of will-it-scale.per_process_ops due t=
o commit:
> =

> =

> commit: 9bd0e337c633aed3e8ec3c7397b7ae0b8436f163 ("[PATCH 01/29] iov_iter=
: Switch to using a table of operations")

Out of interest, would it be possible for you to run this on the tail of the
series on the same hardware?

Thanks,
David

--===============2334691036195523660==--

