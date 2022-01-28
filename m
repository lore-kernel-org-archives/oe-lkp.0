Content-Type: multipart/mixed; boundary="===============5311483439109075735=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [ocfs2] c42ff46f97: sysctl_table_check_failed
Date: Fri, 28 Jan 2022 10:49:16 -0600
Message-ID: <87a6ffst4j.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <20220128120421.kzo5iduigr7k55bs@quack3.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============5311483439109075735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Jan Kara <jack@suse.cz> writes:

> On Fri 28-01-22 10:00:29, Linus Torvalds wrote:
>> On Fri, Jan 28, 2022 at 8:53 AM kernel test robot <oliver.sang@intel.c=
om> wrote:
>> >
>> > commit: 46e33fd45a52bf03769906e64d8a8a1ab317777d ("ocfs2: simplify sub=
directory
>> > registration with register_sysctl()")
>> =

>> Well, it's apparently commit c42ff46f97c1 ("ocfs2: simplify
>> subdirectory registration with register_sysctl()") in mainline now.
>> =

>> What worries me a bit is that the commit was auto-generated, and when
>> reading the commit message it reads as if it wasn't supposed to cause
>> any semantic changes at all.
>> =

>> Is the cause of this that 'nm' is supposed to be a directory, and
>> register_sysctl() doesn't handle directories?
>> =

>> I don't know this code at all, should it have been simplified even
>> further with something (TOTALLY UNTESTED) like the attached?
>
> Yep, I've tested the patch and it fixes the failure for me. Feel free to
> add:
>
> Tested-by: Jan Kara <jack@suse.cz>
>
> Also the change makes sense to me as far as I'm reading register_sysctl()
> so you can also add:
>
> Reviewed-by: Jan Kara <jack@suse.cz>

Yes.  There is a register_sysctl_paths that can be used if you want/need
the embedded directories.  That probably would have been a better
choice for an automated conversion.

But since this there is only the single file in a single directory
register_sysctl() with the full path is perfectly fine in this case.

Reviewed-by: "Eric W. Biederman" <ebiederm@xmission.com>

>> diff --git a/fs/ocfs2/stackglue.c b/fs/ocfs2/stackglue.c
>> index 731558a6f27d..dd77b7aaabf5 100644
>> --- a/fs/ocfs2/stackglue.c
>> +++ b/fs/ocfs2/stackglue.c
>> @@ -661,17 +661,6 @@ static struct ctl_table ocfs2_nm_table[] =3D {
>>  	{ }
>>  };
>>  =

>> -static struct ctl_table ocfs2_mod_table[] =3D {
>> -	{
>> -		.procname	=3D "nm",
>> -		.data		=3D NULL,
>> -		.maxlen		=3D 0,
>> -		.mode		=3D 0555,
>> -		.child		=3D ocfs2_nm_table
>> -	},
>> -	{ }
>> -};
>> -
>>  static struct ctl_table_header *ocfs2_table_header;
>>  =

>>  /*
>> @@ -682,7 +671,7 @@ static int __init ocfs2_stack_glue_init(void)
>>  {
>>  	strcpy(cluster_stack_name, OCFS2_STACK_PLUGIN_O2CB);
>>  =

>> -	ocfs2_table_header =3D register_sysctl("fs/ocfs2", ocfs2_mod_table);
>> +	ocfs2_table_header =3D register_sysctl("fs/ocfs2/nm", ocfs2_nm_table);
>>  	if (!ocfs2_table_header) {
>>  		printk(KERN_ERR
>>  		       "ocfs2 stack glue: unable to register sysctl\n");
--===============5311483439109075735==--

