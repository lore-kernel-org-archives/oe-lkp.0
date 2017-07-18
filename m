Content-Type: multipart/mixed; boundary="===============9084477072754293348=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Tue, 18 Jul 2017 08:26:37 -0500
Message-ID: <871spdj2pe.fsf@xmission.com>
In-Reply-To: <aae67245-4c9c-f79e-b821-40753e732f65@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9084477072754293348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Stefan Berger <stefanb@linux.vnet.ibm.com> writes:

> On 07/18/2017 03:01 AM, James Morris wrote:
>> On Thu, 13 Jul 2017, Stefan Berger wrote:
>>
>>> A file shared by 2 containers, one mapping root to uid=3D1000, the othe=
r mapping
>>> root to uid=3D2000, will show these two xattrs on the host (init_user_n=
s) once
>>> these containers set xattrs on that file.
>> I may be missing something here, but what happens when say the uid=3D2000
>> container and associated user is deleted from the system, then another is
>> created with the same uid?
>>
>> Won't this mean that you have unexpected capabilities turning up in the
>> new container?
>>
>
> Yes, that's right. I don't know any solution for that. We would have to w=
alk the
> filesystems and find all 'stale' xattrs with such a uid. This is independ=
ent of
> whether the uid is encoded on the name side, as in this patch, or on the =
value
> side, as in Serge's original proposal. And uids of a mapped container roo=
t user
> don't necessarily have to have an account on the host so that an account
> deletion could trigger that.

This problem is actually independent of this piece of code entirely.
Any lingering files owned by that uid have the same issue.

Uids are are persistent system property.  It must be arranged that they
are managed carefully.  If you want to reuse a uid userdel or the
equivalent must be able to go out and delete everything they have owned.

Which is to say fundamentally this is userspaces's responsibility.

I don't see this as being particularly subtle or novel.  We already
track which uids and which subordinate uids go together.  I will nack
anything that allows multiple capability attributes per file as we have
established they are unnecessary.  So I don't see any scenarios where
this is likely to come up that it would not be a problem without these
uid tagged security capabilities.

Eric

--===============9084477072754293348==--

