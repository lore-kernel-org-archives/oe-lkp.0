Content-Type: multipart/mixed; boundary="===============2517954373919167114=="
MIME-Version: 1.0
From: Aleksa Sarai <cyphar@cyphar.com>
To: lkp@lists.01.org
Subject: Re: [LTP] [fs] ce436509a8: ltp.openat203.fail
Date: Wed, 29 Apr 2020 01:35:58 +1000
Message-ID: <20200428153558.r32pgvymgk56urtu@yavin.dot.cyphar.com>
In-Reply-To: <20200428153022.GC4244@yuki.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============2517954373919167114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-04-28, Cyril Hrubis <chrubis@suse.cz> wrote:
> Hi!
> > > > commit: ce436509a8e109330c56bb4d8ec87d258788f5f4 ("[PATCH v4 2/3] f=
s: openat2: Extend open_how to allow userspace-selected fds")
> > > > url: https://github.com/0day-ci/linux/commits/Josh-Triplett/Support=
-userspace-selected-fds/20200414-102939
> > > > base: https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-ksel=
ftest.git next
> > > =

> > > This commit adds fd parameter to the how structure where LTP test was
> > > previously passing garbage, which obviously causes the difference in
> > > errno.
> > > =

> > > This could be safely ignored for now, if the patch gets merged the te=
st
> > > needs to be updated.
> > =

> > It wouldn't be a bad idea to switch the test to figure out the ksize of
> > the struct, so that you only add bad padding after that. But then again,
> > this would be a bit ugly -- having CHECK_FIELDS would make this simpler.
> =

> Any pointers how can be the size figured out without relying on the
> E2BIG we are testing for? Does the kernel export it somewhere?

No, you would have to effectively binary search on -E2BIG at the moment.
CHECK_FIELDS is a proposal I have which would allow you to get get the
size of the in-kernel struct, but it's still a proposal.

In theory you could get the size through BTF, but it's probably more
effort than it's worth to implement that.

-- =

Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--===============2517954373919167114==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlIVUVBQllJQUIwV0lRU3habTZkdGZFOGd4
TExmWXFkbExsakliblFFZ1VDWHFoTld3QUtDUkNkbExsakliblEKRXNuOUFRQ2tjMmRxL0RTeTUv
TVlaa05nSmM3R2Z6eHZMSkdQcWZoUmxiRDNBMDlleVFFQTBDZm5uU1ZxV3ppdApQQ3FZZzJDTS9F
VUszNm5IUFdqN3ZRYjdvOGJGU1FvPQo9VHpGbAotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============2517954373919167114==--

