Content-Type: multipart/mixed; boundary="===============5223680519449989930=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Wed, 12 Jul 2017 18:13:41 -0500
Message-ID: <877ezdgsey.fsf@xmission.com>
In-Reply-To: <20170712170346.GA17974@mail.hallyn.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5223680519449989930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Serge E. Hallyn" <serge@hallyn.com> writes:

> Quoting Eric W. Biederman (ebiederm(a)xmission.com):
>> Stefan Berger <"Stefan Bergerstefanb"@linux.vnet.ibm.com> writes:
>> > Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
>> > Signed-off-by: Serge Hallyn <serge@hallyn.com>
>> > Reviewed-by: Serge Hallyn <serge@hallyn.com>
>> =

>> It doesn't look like this is coming through Serge so I don't see how
>> the Signed-off-by tag is legtimate.
>
> This is mostly explained by the fact that there have been a *lot* of
> changes, many of them discussed in private emails.
>
>> >From the replies to this it doesn't look like Serge has reviewed this
>> version either.
>> =

>> I am disappointed that all of my concerns about technical feasibility
>> remain unaddressed.
>
> Can you re-state those, or give a link to them?

Well I only posted about one substantive comment on the last round
so it should be easy to find that said.

The big question is how does this intereact with filesystems
xattr implementations?

There is the potential that we create many more security xattrs this
way.  How does that scale?  With more names etc.
What happens if we have one xattr per uid for 1000+ uids?

How does this interact with filesystems optimization of xattr names?
For some filesystems they optmize the xattr names, and don't store the
entire thing.

> I'd really like to get to a point where unprivileged containers can start
> using filecaps - at this point if that means having an extra temporary
> file format based on my earlier patchset while we hash this out, that
> actually seems worthwhile.  But it would of course be ideal if we could
> do the name based caps right in the first place.

This whole new version has set my review back to square one
unfortunately.

Eric

--===============5223680519449989930==--

