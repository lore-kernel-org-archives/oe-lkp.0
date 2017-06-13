Content-Type: multipart/mixed; boundary="===============1944009617247673374=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v4] Introduce v3 namespaced file capabilities
Date: Tue, 13 Jun 2017 13:42:24 -0400
Message-ID: <f7c51332-e405-f337-3938-ad93bab8f50d@linux.vnet.ibm.com>
In-Reply-To: <20170613171422.i5vsylhqqo736car@smitten>
List-Id: <oe-lkp.lists.linux.dev>

--===============1944009617247673374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/13/2017 01:14 PM, Tycho Andersen wrote:
> Hi Stefan,
>
> On Tue, Jun 13, 2017 at 11:47:26AM -0400, Stefan Berger wrote:
>> On 05/08/2017 02:11 PM, Serge E. Hallyn wrote:
>>> Root in a non-initial user ns cannot be trusted to write a traditional
>>> security.capability xattr.  If it were allowed to do so, then any
>>> unprivileged user on the host could map his own uid to root in a private
>>> namespace, write the xattr, and execute the file with privilege on the
>>> host.
>>>
>>> However supporting file capabilities in a user namespace is very
>>> desirable.  Not doing so means that any programs designed to run with
>>> limited privilege must continue to support other methods of gaining and
>>> dropping privilege.  For instance a program installer must detect
>>> whether file capabilities can be assigned, and assign them if so but set
>>> setuid-root otherwise.  The program in turn must know how to drop
>>> partial capabilities, and do so only if setuid-root.
>> Hi Serge,
>>
>>
>>    I have been looking at patch below primarily to learn how we could ap=
ply a
>> similar technique to security.ima and security.evm for a namespaced IMA.
>>  From the paragraphs above I thought that you solved the problem of a sh=
ared
>> filesystem where one now can write different security.capability xattrs =
by
>> effectively supporting for example security.capability[uid=3D1000] and
>> security.capability[uid=3D2000] written into the filesystem. Each would =
then
>> become visible as security.capability if the userns mapping is set
>> appropriately.
> One disadvantage of this approach is that whoever is setting up the
> container would need to go touch the security.ima attribute for each
> file in the contianer, which would slow down container creation time.
> For capabilities this makes sense, because you might want the file to
> have different capabilities in different namespaces, but for IMA,
> since the file hash will be the same in every namespace, it would be
> nice to use a design that avoids touching each file on new ns
> creation.

Actually IMA in appraisal mode also supports signatures in the extended =

attributes. Depending on which (public) keys you put on the IMA keyring =

for a namespaced IMA, you may need a different signature on a file to be =

able to access it (execute it for example). For this to work containers =

would have to be able to ship with security.ima xattrs embedded in them =

and users should be able to apply signatures on files on a running =

container (or while building it). I worked on a prototype for namespaces =

IMA before where one of the issues was the CAP_SYS_ADMIN gate that =

disallows setting of security.ima when dropped. So some form of =

exception would have to be granted to be allowed to set security.ima =

from inside a container while CAP_SYS_ADMIN isn't there. And of course =

we need to protect the host's filesystem from an attack where the user =

just modifies the security.ima signature associated with a file.

   Stefan


> Cheers,
>
> Tycho
>



--===============1944009617247673374==--

