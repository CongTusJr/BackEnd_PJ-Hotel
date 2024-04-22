<h1>Create</h1>
<form method="post" action="<?php echo route('categorties.create') ?>">
    <div>
        <input type="text" name="name" placeholder="tên...">
    </div>
    <?php echo csrf_field() ?>
    <!-- <input type="hidden" name="_token" value="<?php echo csrf_token() ?>"> -->
    <button type="submit"> Create</button>
</form>