Content-Type: multipart/mixed; boundary="===============4758765338580528736=="
MIME-Version: 1.0
From: Aleksa Sarai <cyphar@cyphar.com>
To: lkp@lists.01.org
Subject: Re: [LTP] [fs] ce436509a8: ltp.openat203.fail
Date: Tue, 28 Apr 2020 10:51:26 +1000
Message-ID: <20200428005126.6wncibudt6ohghvc@yavin.dot.cyphar.com>
In-Reply-To: <20200427142733.GD7661@rei>
List-Id: <oe-lkp.lists.linux.dev>

--===============4758765338580528736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-04-27, Cyril Hrubis <chrubis@suse.cz> wrote:
> Hi!
> > commit: ce436509a8e109330c56bb4d8ec87d258788f5f4 ("[PATCH v4 2/3] fs: o=
penat2: Extend open_how to allow userspace-selected fds")
> > url: https://github.com/0day-ci/linux/commits/Josh-Triplett/Support-use=
rspace-selected-fds/20200414-102939
> > base: https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftes=
t.git next
> =

> This commit adds fd parameter to the how structure where LTP test was
> previously passing garbage, which obviously causes the difference in
> errno.
> =

> This could be safely ignored for now, if the patch gets merged the test
> needs to be updated.

It wouldn't be a bad idea to switch the test to figure out the ksize of
the struct, so that you only add bad padding after that. But then again,
this would be a bit ugly -- having CHECK_FIELDS would make this simpler.

-- =

Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--===============4758765338580528736==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlIVUVBQllJQUIwV0lRU3habTZkdGZFOGd4
TExmWXFkbExsakliblFFZ1VDWHFkK0N3QUtDUkNkbExsakliblEKRWdlVUFQOW02RWtFbDBBR04r
L2VPVCtpL0VhbFEwVnBCUVo4VVl0dkpQNUhiWURDOGdFQTNIdExGajhlSGJjZQpZOXBqNEFaQ1JK
VkxoUjFxVndyb3UrWDZyWlZKMEFvPQo9cDJITQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============4758765338580528736==--

