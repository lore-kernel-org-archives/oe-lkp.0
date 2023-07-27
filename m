Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1D4D2F7
	for <oe-lkp@lists.linux.dev>; Thu, 27 Jul 2023 08:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFF0C433C8;
	Thu, 27 Jul 2023 08:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690447950;
	bh=AuMxo34AUpmkl0Yqv80MIJPx7PKx9VvtA+IEF7Kq6UU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGiNSiA0AOi+5UW7LO6P65q6mofLmrerXULuQNiP3MXOoR7FE5hJjzpP+WZ8VtNOI
	 BiZ5DmUEIHLCz9Pe4Jf+F3fRzo4m7JnjA+lNZyB5YuGlT3Cy0AKwKbwINwR5ZAJUr1
	 SZKHrtpSttCNtwRGD8WnElpHZWIDFXy5eO37/GvXA+gbk7YdMP/QZLKuugykCIU3st
	 paW5O4WuEtHd8qoilrQEjwfgiVcaHpYhbnpuSoTsGSCxvhdx98WtFJmKVMb+96tV+4
	 G2fYKVkCYMSjwwvMsHx040uotOri65KtTBLXSLFsjzHaCTG8mnnWBdusI/dIp2jwkk
	 ufSeEf4XmoO5w==
Date: Thu, 27 Jul 2023 10:52:25 +0200
From: Christian Brauner <brauner@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Jeff Layton <jlayton@kernel.org>, oe-lkp@lists.linux.dev, lkp@intel.com,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org
Subject: Re: [brauner-vfs:vfs.ctime] [ext4]  979492850a:
 xfstests.generic.371.fail
Message-ID: <20230727-archaisch-funknetz-c7158b8406ad@brauner>
References: <202307271100.7155c64a-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202307271100.7155c64a-oliver.sang@intel.com>

On Thu, Jul 27, 2023 at 01:32:52PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "xfstests.generic.371.fail" on:
> 
> commit: 979492850abd8e0d6ab0081be7593b32e5e6c9cc ("ext4: convert to ctime accessor functions")
> https://git.kernel.org/cgit/linux/kernel/git/vfs/vfs.git vfs.ctime

This is outdated the diff between the commit version referenced here and
the one currently in the branch is:

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 2af347669db7..1e2259d9967d 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -900,8 +900,10 @@ do {                                                                               \
 #define EXT4_INODE_SET_CTIME(inode, raw_inode)                                 \
        EXT4_INODE_SET_XTIME_VAL(i_ctime, inode, raw_inode, inode_get_ctime(inode))

-#define EXT4_EINODE_SET_XTIME(xtime, einode, raw_inode)                               \
-       EXT4_INODE_SET_XTIME_VAL(xtime, &((einode)->vfs_inode), raw_inode, (einode)->xtime)
+#define EXT4_EINODE_SET_XTIME(xtime, einode, raw_inode)                                \
+       if (EXT4_FITS_IN_INODE(raw_inode, einode, xtime))                       \
+               EXT4_INODE_SET_XTIME_VAL(xtime, &((einode)->vfs_inode),         \
+                                        raw_inode, (einode)->xtime)

 #define EXT4_INODE_GET_XTIME_VAL(xtime, inode, raw_inode)                      \
        (EXT4_FITS_IN_INODE(raw_inode, EXT4_I(inode), xtime ## _extra) ?        \
@@ -922,9 +924,14 @@ do {                                                                               \
                EXT4_INODE_GET_XTIME_VAL(i_ctime, inode, raw_inode));           \
 } while (0)

-#define EXT4_EINODE_GET_XTIME(xtime, einode, raw_inode)                               \
-do {                                                                          \
-       (einode)->xtime = EXT4_INODE_GET_XTIME_VAL(xtime, &(einode->vfs_inode), raw_inode);     \
+#define EXT4_EINODE_GET_XTIME(xtime, einode, raw_inode)                                \
+do {                                                                           \
+       if (EXT4_FITS_IN_INODE(raw_inode, einode, xtime))                       \
+               (einode)->xtime =                                               \
+                       EXT4_INODE_GET_XTIME_VAL(xtime, &(einode->vfs_inode),   \
+                                                raw_inode);                    \
+       else                                                                    \
+               (einode)->xtime = (struct timespec64){0, 0};                    \
 } while (0)

 #define i_disk_version osd1.linux1.l_i_version
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 07f6d96ebc60..933ad03f4f58 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -3957,7 +3957,7 @@ static int ext4_rename(struct mnt_idmap *idmap, struct inode *old_dir,
                ext4_dec_count(new.inode);
                inode_set_ctime_current(new.inode);
        }
-       old.dir->i_mtime = inode_set_ctime_current(old.inode);
+       old.dir->i_mtime = inode_set_ctime_current(old.dir);
        ext4_update_dx_flag(old.dir);
        if (old.dir_bh) {
                retval = ext4_rename_dir_finish(handle, &old, new.dir->i_ino);

With that I can't reproduce the reported failure.

FSTYP         -- ext4
PLATFORM      -- Linux/x86_64 imp1-vm 6.5.0-rc1-vfs-all-91bcc05fab9b #139 SMP PREEMPT_DYNAMIC Wed Jul 26 15:51:58 UTC 2023
MKFS_OPTIONS  -- -F /dev/sda4
MOUNT_OPTIONS -- -o acl,user_xattr /dev/sda4 /mnt/scratch

generic/371 10s ...  15s
Ran: generic/371
Passed all 1 tests

