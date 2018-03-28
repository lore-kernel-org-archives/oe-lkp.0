Content-Type: multipart/mixed; boundary="===============5041288716926256487=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: 98f929b1bd ("ipc/shm: Fix shmctl(..., IPC_STAT, ...) between .."): Oops: 0000 [#1]
Date: Wed, 28 Mar 2018 12:53:31 -0500
Message-ID: <87o9j8axyc.fsf@xmission.com>
In-Reply-To: <f249d351-240a-8c0e-ef50-f9155b696e86@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5041288716926256487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com> writes:

> Hi Eric,
>
> =C2=A0=C2=A0=C2=A0 From
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.g=
it/tree/ipc/shm.c?h=3Dfor-next
>
> It looks like if the following condition in Line 616 succeeds
>
> error =3D PTR_ERR(file);
> if (IS_ERR(file))
> =C2=A0=C2=A0=C2=A0 goto no_file;
>
> we get to no_file with garbage value in shm_cprid. An attempt to
> put_pid on this garbage value might be causing panic.
>
> We could initialize shm_cprid to NULL as soon as it was created.

Yes.  I misread the kvmalloc as a kvzalloc.
I am planning on placing the pid freeing under the no_id label
instead of the no_file label.  Which should also avoid the issue.

It is a rare enough issue an incremental patch should be fine.

Eric

--===============5041288716926256487==--

